import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { Feature } from "src/entities/feature.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { AddFeaturerDto } from "src/dtos/feature/add.feature.dto";
import { ApiResponse } from "src/misc/api.response.class";

@Injectable()
export class FeatureService extends TypeOrmCrudService<Feature> {
    constructor(@InjectRepository(Feature) private readonly feature: Repository<Feature>) {
        super(feature);
    }

    async add(data: AddFeaturerDto): Promise<Feature | ApiResponse> {
        try {
            const savedFeature = await this.feature.save(data);
            
            if (!savedFeature) {
                throw new Error('');
            }

            return savedFeature;
        } catch (error) {
            return new ApiResponse('error', -7003, 'Could not save the new feature.');
        }
    }
}