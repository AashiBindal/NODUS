export default function AiChatbot() {
  return (
    <div className="bg-slate-800 p-6 rounded-xl border border-slate-700 h-full flex flex-col justify-between">
      <div>
        <h3 className="text-lg font-bold text-cyan-400 mb-4">Syllabus-Grounded AI Tutor</h3>
        <div className="p-3 bg-slate-900 rounded mb-2 text-sm">Bot: Ask any doubt from Unit 3 (Trees & Graphs) or request PYQs!</div>
      </div>
      <input type="text" placeholder="Ask your doubt..." className="w-full bg-slate-900 border border-slate-700 p-2 rounded text-sm focus:outline-none" />
    </div>
  )
}
