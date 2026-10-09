from fastapi import APIRouter

router = APIRouter()

@router.get("/student/{student_id}")
def get_student_progress(student_id: int):
    return {"student_id": student_id, "completion_rate": "78%", "units_completed": 14, "pending_tasks": 2}
