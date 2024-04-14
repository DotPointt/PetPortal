namespace PetPortal.Core.Models;

public class Project
{
    public const int MAX_NAME_LENGHT = 250;

    public Project(Guid id, string name, string description) 
    {
        Id = id;
        Name = name;
        Description = description;
    }
        
    public Guid Id { get; }

    public string Name { get; } = string.Empty;

    public string Description { get; } = string.Empty;
        

    public static (Project project, string Error) Create(Guid id, string name, string description)
    {
        var error = string.Empty;

        if (string.IsNullOrEmpty(name) || name.Length > MAX_NAME_LENGHT) 
        {
            error = "Name can not be empty or longer then 250 symbols";
        }

        var project = new Project(id, name, description);

        return (project, error);
    }
}