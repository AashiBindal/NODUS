'use client'
import KnowledgeGraph from '@/components/KnowledgeGraph'
import AiChatbot from '@/components/AiChatbot'
import NoteEditor from '@/components/NoteEditor'
import AssignmentCard from '@/components/AssignmentCard'

export default function StudentDashboard() {
  return (
    <div className="p-6 grid grid-cols-12 gap-6 h-screen">
      <div className="col-span-8 flex flex-col gap-6">
        <KnowledgeGraph />
        <AssignmentCard />
      </div>
      <div className="col-span-4">
        <AiChatbot />
      </div>
      <NoteEditor />
    </div>
  )
}
