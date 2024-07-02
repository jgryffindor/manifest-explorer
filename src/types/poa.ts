export interface PoaParamsResponse {
    params: PoaParams;
  }
  
  interface PoaParams {
    admins: string[];
    allow_validator_self_exit: boolean;
  }