using Microsoft.EntityFrameworkCore;
using PetPortal.Core.Abstractions;
using PetPortal.Core.Models;
using PetPortal.DataAccess.Entities;

namespace PetPortal.DataAccess.Repositories;

public class ProjectsRepository : IProjectsRepository
{
    private readonly PetPortalDbContext _context;

    public ProjectsRepository(PetPortalDbContext context)
    {
        _context = context;
    }

    public async Task<List<Project>> Get()
    {
        var projectEntities = await _context.Projects
            .AsNoTracking()
            .ToListAsync();

        var projects = projectEntities
            .Select(p => Project.Create(p.Id, p.Name, p.Description).project)
            .ToList();

        return projects;
    }

    public async Task<Guid> Create(Project project)
    {
        var projectEntity = new ProjectEntity
        {
            Id = project.Id,
            Name = project.Name,
            Description = project.Description
        };

        await _context.AddAsync(projectEntity);
        await _context.SaveChangesAsync();

        return projectEntity.Id;
    }

    public async Task<Guid> Update(Guid id, string name, string description)
    {
        await _context.Projects
            .Where(p => p.Id == id)
            .ExecuteUpdateAsync(s => s
                .SetProperty(p => p.Name, p => name)
                .SetProperty(p => p.Description, p => description));

        return id;
    }

    public async Task<Guid> Delete(Guid id)
    {
        await _context.Projects
            .Where(p => p.Id == id)
            .ExecuteDeleteAsync();

        return id;
    }
}