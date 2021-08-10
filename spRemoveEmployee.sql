CREATE PROCEDURE spRemoveEmployee  
(  
@Id INT 
)  
as  
begin  
        DELETE FROM employee WHERE  Id = @Id
        DELETE FROM Employee_Payroll WHERE  Id = @Id
		DELETE FROM Payroll WHERE  Id = @Id
		DELETE FROM EmployeeDepartment WHERE  Id = @Id 
end 