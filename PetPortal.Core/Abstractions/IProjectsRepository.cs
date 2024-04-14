using PetPortal.Core.Models;

namespace PetPortal.Core.Abstractions;

public interface IProjectsRepository
{
    Task<Guid> Create(Project project);
    Task<Guid> Delete(Guid id);
    Task<List<Project>> Get();
    Task<Guid> Update(Guid id, string name, string description);
}