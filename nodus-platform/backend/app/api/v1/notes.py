from fastapi import APIRouter
from app.models.schemas import NoteCreate

router = APIRouter()

@router.get("/public/{unit_id}")
def get_faculty_notes(unit_id: int):
    return {"unit_id": unit_id, "notes": ["Lecture_1_Trees.pdf", "AI_Summary_Unit3.md"]}

@router.post("/self-notes")
def create_private_self_note(note: NoteCreate):
    # Saves Obsidian-style markdown notes locally/DB for student
    return {"status": "success", "note_id": 101, "is_private": True}
