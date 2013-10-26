require 'spec_helper'

describe User do
  it { should have_many(:privileged_sessions) }

  it "privileges can be revoked" do
    user = create(:user)
    a = create(:privileged_session, user: user)
    b = create(:privileged_session, user: user)

    expect(user.privileged?(a.key)).to be
    expect(user.privileged?(b.key)).to be

    user.revoke_privileges!(a.key)

    expect(user.privileged?(a.key)).not_to be
    expect(user.privileged?(b.key)).to be
  end
end
