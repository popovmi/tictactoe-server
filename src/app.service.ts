import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'HELLOOOOOO DEAR WORLD';
  }
}
