from pydantic import BaseModel
from typing import List, Optional

class UserRegister(BaseModel):
    name: str
    email: str
    password: str
    role: str # student / faculty
    branch_id: int
    section_id: Optional[str] = None

class UserLogin(BaseModel):
    email: str
    password: str

class TokenResponse(BaseModel):
    access_token: str
    token_type: str
    role: str

class NoteCreate(BaseModel):
    unit_id: int
    title: str
    content: str

class AssignmentCreate(BaseModel):
    subject_id: int
    title: str
    due_date: str
    target_sections: List[str]

class ChatQuery(BaseModel):
    unit_id: int
    question: str
