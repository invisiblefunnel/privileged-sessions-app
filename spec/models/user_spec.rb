require 'spec_helper'

describe User do
  it { should have_many(:privileged_sessions) }

  it "privileges can be revoked" do
    user = create(:user)
    session = create(:privileged_session, user: user)

    expect(user.privileged?(session.key)).to be_true
    user.revoke_privileges!
    expect(user.privileged?(session.key)).to be_false
  end
end
