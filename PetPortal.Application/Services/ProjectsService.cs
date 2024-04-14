using PetPortal.Core.Abstractions;
using PetPortal.Core.Models;

namespace PetPortal.Application.Services;

public class ProjectsService : IProjectsService
{
    public readonly IProjectsRepository _ProjectsRepository;

    public ProjectsService(IProjectsRepository projectsRepository)
    {
        _ProjectsRepository = projectsRepository;
    }

    public async Task<List<Project>> GetAllProjects()
    {
        return await _ProjectsRepository.Get();
    }

    public async Task<Guid> CreateProject(Project project)
    {
        return await _ProjectsRepository.Create(project);
    }

    public async Task<Guid> UpdateProject(Guid id, string name, string description)
    {
        return await _ProjectsRepository.Update(id, name,description);
    }

    public async Task<Guid> Delete(Guid id)
    {
        return await _ProjectsRepository.Delete(id);
    }
}