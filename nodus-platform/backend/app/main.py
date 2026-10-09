from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.v1 import auth, graph, semesters, notes, assignments, ai_tutor, progress
from app.core.config import settings

app = FastAPI(
    title="NODUS API Engine",
    description="Backend services for NODUS Academic Knowledge Platform",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router, prefix="/api/v1/auth", tags=["Auth"])
app.include_router(graph.router, prefix="/api/v1/graph", tags=["Knowledge Graph"])
app.include_router(semesters.router, prefix="/api/v1/semesters", tags=["Semesters & Locking"])
app.include_router(notes.router, prefix="/api/v1/notes", tags=["Notes & Self-Editor"])
app.include_router(assignments.router, prefix="/api/v1/assignments", tags=["Assignments & Timers"])
app.include_router(ai_tutor.router, prefix="/api/v1/ai", tags=["AI Tutor & RAG Engine"])
app.include_router(progress.router, prefix="/api/v1/progress", tags=["Analytics & Progress"])

@app.get("/")
def read_root():
    return {"message": "Welcome to NODUS API Gateway"}
