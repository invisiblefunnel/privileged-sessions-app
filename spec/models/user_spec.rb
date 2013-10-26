require 'spec_helper'

describe User do
  it { should have_many(:privileged_sessions) }

  it "privileges can be revoked" do
    user = create(:user)
    a = create(:privileged_session, user: user)
    b = create(:privileged_session, user: user)

    expect(user.privileged?(a.key)).to be_true
    expect(user.privileged?(b.key)).to be_true

    user.revoke_privilege!(a.key)

    expect(user.privileged?(a.key)).to be_false
    expect(user.privileged?(b.key)).to be_true
  end
end
