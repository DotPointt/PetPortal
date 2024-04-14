using Microsoft.EntityFrameworkCore;
using PetPortal.DataAccess.Entities;

namespace PetPortal.DataAccess;

public class PetPortalDbContext : DbContext
{
    public PetPortalDbContext(DbContextOptions<PetPortalDbContext> options)
        : base(options)
    {
    }
    
    public DbSet<ProjectEntity> Projects { get; set; }
}