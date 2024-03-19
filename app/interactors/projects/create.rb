module Projects
  class Create
    include Interactor::Organizer

    delegate :project, :user, to: :context

    organize Projects::Save
  end
end
