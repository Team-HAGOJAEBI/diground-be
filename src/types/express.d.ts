type JwtPayload = {
  sub: string;
  email?: string;
  name?: string;
  picture?: string;
  iat?: number;
};

declare global {
  namespace Express {
    // eslint-disable-next-line @typescript-eslint/no-empty-object-type
    interface User extends JwtPayload {}
  }
}
