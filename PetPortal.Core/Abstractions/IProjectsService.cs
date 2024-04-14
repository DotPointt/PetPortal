using PetPortal.Core.Models;

namespace PetPortal.Core.Abstractions;

public interface IProjectsService
{
    Task<List<Project>> GetAllProjects();
    Task<Guid> CreateProject(Project project);
    Task<Guid> UpdateProject(Guid id, string name, string description);
    Task<Guid> Delete(Guid id);
}