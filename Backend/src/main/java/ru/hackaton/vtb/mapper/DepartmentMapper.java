package ru.hackaton.vtb.mapper;

import org.springframework.stereotype.Component;
import ru.hackaton.vtb.dto.DepartmentDto;
import ru.hackaton.vtb.model.Department;
import ru.hackaton.vtb.model.DepartmentService;

import java.util.List;

@Component
public class DepartmentMapper {

    public DepartmentDto toDto(Department department, DepartmentDto departmentDto, int minWorkLoad) {
        return DepartmentDto.builder()
                .service(departmentDto.getService())
                .accountWorkload(departmentDto.getAccountWorkload())
                .radius(departmentDto.getRadius())
                .workload((double)minWorkLoad)
                .department(department.getDepartment())
                .longitude(department.getLongitude())
                .latitude(department.getLatitude())
                .build();
    }
    public DepartmentDto toDto(Department department, DepartmentDto departmentDto, double minWorkLoad, List<Integer> services) {
        return DepartmentDto.builder()
                .service(services)
                .accountWorkload(departmentDto.getAccountWorkload())
                .radius(departmentDto.getRadius())
                .workload((double)minWorkLoad)
                .department(department.getDepartment())
                .longitude(department.getLongitude())
                .latitude(department.getLatitude())
                .build();
    }
}
