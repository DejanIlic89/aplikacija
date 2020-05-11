import { Controller, Body, Post, UseGuards } from "@nestjs/common";
import { Crud } from "@nestjsx/crud";
import { Feature } from "src/entities/feature.entity";
import { FeatureService } from "src/services/feature/feature.service";
import { AddFeaturerDto } from "src/dtos/feature/add.feature.dto";
import { ApiResponse } from "src/misc/api.response.class";
import { AllowToRoles } from "src/misc/allow.to.roles.descriptor";
import { RoleCheckerGuard } from "src/misc/role.checker.guard";

@Controller('api/feature')
@Crud({
    model: {
        type: Feature
    },
    params: {
        id: {
            field: 'feature_id',
            type: 'number',
            primary: true
        }
    },
    query: {
        join: {
            category: {
                eager: true
            },
            articleFeatures: {
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
export class FeatureController {
    constructor(public service: FeatureService) {}

    @Post()
    @UseGuards(RoleCheckerGuard)
    @AllowToRoles('administrator')
    add(@Body() data: AddFeaturerDto): Promise<Feature | ApiResponse> {
        return this.service.add(data);
    }
}