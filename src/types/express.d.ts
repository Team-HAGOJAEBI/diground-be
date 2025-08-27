import {Express} from 'express';

type JwtPayload = {
  sub: string;
  email?: string;
  name?: string;
  picture?: string;
  iat?: number;
};

declare global{
  namespace Express{
    interface User extends JwtPayload{}
  }
}