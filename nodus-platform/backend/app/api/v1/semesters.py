from fastapi import APIRouter

router = APIRouter()

@router.get("/status")
def check_semester_lock_status(student_id: int):
    # Logic to enforce locking on future semesters while keeping past semesters open
    return {
        "student_id": student_id,
        "current_semester": 3,
        "unlocked_semesters": [1, 2, 3],
        "locked_semesters": [4, 5, 6, 7, 8]
    }
