


  interface Group {
    id: string;
    admin: string;
    metadata: string;
    version: string;
    total_weight: string;
    created_at: string;
  }
  
  interface Pagination {
    next_key: string | null;
    total: string;
  }

  export interface AdminGroup {
    groups: Group[];
    pagination: Pagination;
  }
  