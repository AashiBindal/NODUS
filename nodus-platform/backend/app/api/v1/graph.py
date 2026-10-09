from fastapi import APIRouter

router = APIRouter()

@router.get("/tree")
def get_knowledge_graph(branch_id: int):
    # Returns 4-Year Academic Hierarchy (Year -> Semester -> Subject -> Unit)
    return {
        "branch": "Computer Science & Engineering",
        "nodes": [
            {"id": "sem1", "label": "Semester 1", "type": "semester", "status": "unlocked"},
            {"id": "sem2", "label": "Semester 2", "type": "semester", "status": "unlocked"},
            {"id": "sem3", "label": "Semester 3", "type": "semester", "status": "active"},
            {"id": "sem4", "label": "Semester 4", "type": "semester", "status": "locked"}
        ]
    }
