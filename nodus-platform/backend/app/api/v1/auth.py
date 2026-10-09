from fastapi import APIRouter, HTTPException, Depends
from app.models.schemas import UserLogin, UserRegister, TokenResponse

router = APIRouter()

@app.post("/register", response_model=TokenResponse)
def register(user: UserRegister):
    # TODO: Register student/faculty with role, branch, and section mapping
    return {"access_token": "dummy_jwt_token", "token_type": "bearer", "role": user.role}

@app.post("/login", response_model=TokenResponse)
def login(credentials: UserLogin):
    # TODO: Validate credentials via MS SQL Server
    return {"access_token": "dummy_jwt_token", "token_type": "bearer", "role": "student"}
