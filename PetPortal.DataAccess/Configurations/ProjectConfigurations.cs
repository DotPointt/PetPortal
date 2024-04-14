using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PetPortal.Core.Models;
using PetPortal.DataAccess.Entities;

namespace PetPortal.DataAccess.Configurations;

public class ProjectConfigurations : IEntityTypeConfiguration<ProjectEntity>
{
    public void Configure(EntityTypeBuilder<ProjectEntity> builder)
    {
        builder.HasKey(x => x.Id);

        builder.Property(p => p.Name)
            .HasMaxLength(Project.MAX_NAME_LENGHT)
            .IsRequired();

        builder.Property(p => p.Description)
            .IsRequired();
    }
}