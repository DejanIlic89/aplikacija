import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from "@nestjsx/crud-typeorm";
import { Category } from "src/entities/category.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { AddCategoryDto } from "src/dtos/category/add.category.dto";
import { ApiResponse } from "src/misc/api.response.class";

@Injectable()
export class CategoryService extends TypeOrmCrudService<Category> {
    constructor(@InjectRepository(Category) private readonly category: Repository<Category>) {
        super(category);
    }

    async add(data: AddCategoryDto): Promise<Category | ApiResponse> {
        try {
            const savedCategory = await this.category.save(data);
            
            if (!savedCategory) {
                throw new Error('');
            }

            return savedCategory;
        } catch (error) {
            return new ApiResponse('error', -8003, 'Could not save the new category.');
        }
    }
}