require 'spec_helper'

describe PrivilegedSession do
  it { should belong_to(:user) }

  it "generates a unique key" do
    user = create(:user)
    a = build(:privileged_session, user: user)
    b = build(:privileged_session, user: user)

    expect(a.key).to eq nil
    expect(b.key).to eq nil

    a.valid?
    b.valid?

    expect(a.key).not_to eq nil
    expect(b.key).not_to eq nil
    expect(a.key).not_to eq b.key
  end

  it "is not active when revoked" do
    session = create(:privileged_session)
    expect(PrivilegedSession.active).to include(session)
    session.update(revoked_at: Time.now)
    expect(PrivilegedSession.active).not_to include(session)
  end

  it "remains active for 1 hour from creation" do
    user = create(:user)
    inactive = create(:privileged_session, user: user, created_at: 61.minutes.ago)
    active = create(:privileged_session, user: user, created_at: 59.minutes.ago)

    active_sessions = user.privileged_sessions.active.to_a

    expect(active_sessions).not_to include(inactive)
    expect(active_sessions).to include(active)
  end

  it "doesn't change the key when updating" do
    session = create(:privileged_session)
    initial = session.key

    session.update(revoked_at: Time.now)

    expect(session.key).to eq initial
  end
end
