using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using PetPortal.API.Contracts;
using PetPortal.Core.Abstractions;
using PetPortal.Core.Models;

namespace PetPortal.API.Controllers;

[ApiController]
[Route("[controller]")]
public class ProjectsController
{
    private readonly IProjectsService _projectsService;
    
    public ProjectsController(IProjectsService projectsService)
    {
        _projectsService = projectsService;
    }

    [HttpGet]
    public async Task<ActionResult<List<ProjectsResponse>>> GetProjects()
    {
        var projects = await _projectsService.GetAllProjects();
        
        var response = projects.Select(p => new ProjectsResponse(p.Id, p.Name, p.Description));

        return Ok(response);
    }

    [HttpPost]
    public async Task<ActionResult<Guid>> CreateProject([FromBody] ProjectsRequest request)
    {
        var (project, error) = Project.Create(
            Guid.NewGuid(),
            request.name,
            request.description);

        if (!string.IsNullOrEmpty(error))
        {
            return BadRequest(error);
        }

        await _projectsService.CreateProject(project);
        
        return Ok(error);
    }

    [HttpPut("{id:guid}")]
    public async Task<ActionResult<Guid>> UpdateProject(Guid id, [FromBody] ProjectsRequest request)
    {
        var projectId = await _projectsService.UpdateProject(id, request.name, request.description);

        return Ok(projectId);
    }
    
    
    [HttpDelete]
    public async Task<ActionResult<Guid>> DeleteProject([FromBody] Guid id)
    {
        var projectId = await _projectsService.Delete(id);

        return Ok(projectId);
    }
}