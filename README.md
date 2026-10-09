# NODUS
A graph-based academic platform with progressive semester unlocking, interactive node course maps, syllabus-grounded AI tutor, section-wise faculty uploads, automated assignment timers, and private markdown notes.
## 📌 Architecture Overview

## 🏗️ System Architecture

NODUS is an AI-powered academic management platform that connects students and faculty through a centralized system for syllabus navigation, learning resources, assignments, academic progress tracking, and AI-assisted doubt solving.

```mermaid
flowchart TB
    N["NODUS PLATFORM"]

    N --> SD["Student Dashboard"]
    N --> FP["Faculty Portal"]

    subgraph STUDENT["🎓 Student Dashboard"]
        SD --> KG["Knowledge Graph<br/>Year → Branch → Semester → Subject → Unit"]
        SD --> SL["Progressive Semester Unlocking"]
        SD --> NE["Interactive Notes & Self-Notes"]
        SD --> AT["AI Tutor Chat"]
        SD --> PQ["Practice Questions & Unit-wise PYQs"]
        SD --> AS["Assignment Status & Deadlines"]
    end

    subgraph FACULTY["👨‍🏫 Faculty Portal"]
        FP --> CU["Central Upload Engine<br/>Notes, PDFs & PPTs"]
        FP --> AC["Section-wise Assignment Creator"]
        FP --> DC["Deadline & Timer Configuration"]
        FP --> PA["Student Progress Analytics"]
    end

    KG --> API["API Gateway & Authentication"]
    NE --> API
    AT --> API
    PQ --> API
    AS --> API
    CU --> API
    AC --> API
    DC --> API
    PA --> API

    subgraph SERVICES["⚙️ Application Services"]
        API --> AUTH["Authentication & Role-Based Access"]
        API --> MAP["Branch, Semester & Section Mapping"]
        API --> RES["Academic Resource Service"]
        API --> ASS["Assignment & Submission Service"]
        API --> PROG["Progress Tracking Service"]
        API --> NOTI["Notification & Reminder Engine"]
    end

    subgraph AI["🤖 AI & RAG ENGINE"]
        RES --> ING["Document Ingestion & Text Extraction"]
        ING --> CH["Text Chunking & Embeddings"]
        CH --> VDB[("Vector Database<br/>Pinecone / Qdrant")]
        AT --> RET["Semantic Retrieval"]
        VDB --> RET
        RET --> LLM["Syllabus-Grounded LLM<br/>Gemini / OpenAI"]
        LLM --> ANS["Context-Aware Answers"]
        ING --> SUM["AI Notes Summarization"]
        PQ --> QGEN["AI Practice Question Generation"]
    end

    subgraph DATA["🗄️ Data & Storage Layer"]
        RES --> SQL[("MS SQL Server<br/>Academic & User Data")]
        AUTH --> SQL
        MAP --> SQL
        ASS --> SQL
        PROG --> SQL
        CU --> OBJ[("Object Storage<br/>AWS S3 / Cloudflare R2")]
        OBJ --> ING
        ASS --> OBJ
    end

    subgraph DELIVERY["📬 Notifications & Delivery"]
        ASS --> NOTI
        DC --> NOTI
        NOTI --> REM["Deadline Alerts<br/>2-Day Reminder & Due-Date Alert"]
        REM --> STUD["Student Notifications"]
    end

    ANS --> SD
    SUM --> SD
    QGEN --> SD
    SQL --> PA

    classDef user fill:#dbeafe,stroke:#2563eb,color:#172554
    classDef service fill:#ede9fe,stroke:#7c3aed,color:#312e81
    classDef ai fill:#dcfce7,stroke:#16a34a,color:#14532d
    classDef data fill:#ffedd5,stroke:#ea580c,color:#7c2d12
    classDef notify fill:#fce7f3,stroke:#db2777,color:#831843

    class SD,FP,KG,SL,NE,AT,PQ,AS,CU,AC,DC,PA user
    class API,AUTH,MAP,RES,ASS,PROG service
    class ING,CH,VDB,RET,LLM,ANS,SUM,QGEN ai
    class SQL,OBJ data
    class NOTI,REM,STUD notify
```

### 🔄 Architecture Workflow

1. **Student & Faculty Access:** Users access their respective dashboards through authentication and role-based permissions.
2. **Academic Resource Management:** Faculty upload notes, PDFs, and PPTs and create section-specific assignments with deadlines.
3. **AI Processing Pipeline:** Uploaded documents are extracted, split into chunks, converted into embeddings, and indexed in a vector database.
4. **AI-Powered Learning:** Student questions trigger semantic retrieval. Relevant syllabus content is provided to the LLM to generate context-aware answers.
5. **Database & Storage:** MS SQL Server stores structured academic information, while object storage keeps documents and submissions.
6. **Notifications & Analytics:** The platform tracks assignment submissions, sends deadline reminders, and provides progress analytics by branch and section.



## 🌟 Key Features

### 🎓 Student Dashboard
* **Interactive Knowledge Graph:** Dynamic visual graph mapping prerequisites and course structure across 4 academic years (`Year ➔ Branch ➔ Semester ➔ Subject ➔ Unit`).
* **Progressive Semester Unlocking:** Past semesters remain unlocked for revision, current active semester is highlighted, and future semesters are locked 🔒.
* **Private Self-Notes:** Floating `(+)` action button launching a markdown note editor for personal study vaults.
* **Syllabus-Grounded AI Tutor:** Embedded RAG-based AI chatbot providing doubt resolution, note summarization, and unit-wise PYQs strictly from faculty-approved documents.
* **Practice Quizzes:** AI-generated unit-level quizzes for rapid self-assessment.

### 👩‍🏫 Faculty Portal
* **Central Unidirectional Uploads:** Upload study materials, lecture slides, and notes globally accessible to all relevant student sections.
* **Section-Targeted Assignments:** Create and dispatch assignments specifically targeted to designated sections (e.g., Section A, Section B).
* **Configurable Submission Timers:** Set automated reminder triggers for student submission deadlines.
* **Student Progress Analytics:** Track section-wise assignment completion rates and academic progression.

### ⚡ Core Infrastructure
* **Smart Reminder Engine:** Automated notification triggers dispatching alerts 2 days prior to deadlines and on submission day.
* **Role-Based Access Control (RBAC):** Strict security mapping separating Student, Fac
