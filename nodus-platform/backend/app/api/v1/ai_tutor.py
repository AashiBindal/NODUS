from fastapi import APIRouter
from app.models.schemas import ChatQuery

router = APIRouter()

@router.post("/chat")
def ask_ai_tutor(query: ChatQuery):
    # RAG pipeline query grounded on faculty uploads & syllabus
    return {
        "answer": "Binary Search Tree search complexity is O(log n) in balanced cases and O(n) worst case.",
        "sources": ["Lecture_Slides_Trees.pdf"]
    }

@router.get("/pyq-generator/{unit_id}")
def generate_unit_pyqs(unit_id: int):
    return {"unit_id": unit_id, "questions": ["Explain BST balancing.", "Compare DFS vs BFS."]}
