select company_code, founder, count(distinct lead_manager_code), count(distinct senior_manager_code), count(distinct manager_code), count(distinct employee_code)
from (select company.company_code as company_code, company.founder as founder, lead_manager.lead_manager_code as lead_manager_code,
senior_manager.senior_manager_code as senior_manager_code, manager.manager_code as manager_code, employee.employee_code as employee_code
from company, lead_manager, senior_manager, manager, employee
where company.company_code=lead_manager.company_code
    and lead_manager.lead_manager_code=senior_manager.lead_manager_code
    and senior_manager.senior_manager_code=manager.senior_manager_code
    and manager.manager_code=employee.manager_code) as final_table
group by company_code,founder
order by company_code;
