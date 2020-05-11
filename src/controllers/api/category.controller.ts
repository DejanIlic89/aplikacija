import { Controller, Post, Body, UseGuards } from "@nestjs/common";
import { Crud } from "@nestjsx/crud";
import { Category } from "src/entities/category.entity";
import { CategoryService } from "src/services/category/category.service";
import { AddCategoryDto } from "src/dtos/category/add.category.dto";
import { ApiResponse } from "src/misc/api.response.class";
import { AllowToRoles } from "src/misc/allow.to.roles.descriptor";
import { RoleCheckerGuard } from "src/misc/role.checker.guard";

@Controller('api/category')
@Crud({
    model: {
        type: Category
    },
    params: {
        id: {
            field: 'category_id',
            type: 'number',
            primary: true
        }
    },
    query: {
        join: {
            categories: {
                eager: true
            },
            features: {
                eager: true
            },
            parentCategory: {
                eager: false
            },
            articles: {
                eager: false
            }
        }
    },
    routes: {
        exclude: [
            'createOneBase'
        ],
        only: [
            "createManyBase",
            "updateOneBase",
            "getManyBase",
            "getOneBase",
        ],
        createManyBase: {
            decorators: [
                UseGuards(RoleCheckerGuard),
                AllowToRoles("administrator"),
            ]
        },
        updateOneBase: {
            decorators: [
                UseGuards(RoleCheckerGuard),
                AllowToRoles("administrator"),
            ]
        },
        getManyBase: {
            decorators: [
                UseGuards(RoleCheckerGuard),
                AllowToRoles("administrator", "user"),
            ]
        },
        getOneBase: {
            decorators: [
                UseGuards(RoleCheckerGuard),
                AllowToRoles("administrator", "user"),
            ]
        },
    }
})
export class CategoryController {
    constructor(public service: CategoryService) {}

    @Post()
    @UseGuards(RoleCheckerGuard)
    @AllowToRoles('administrator')
    add(@Body() data: AddCategoryDto): Promise<Category | ApiResponse> {
        return this.service.add(data);
    }
}