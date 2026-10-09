'use client'
import { useState } from 'react'

export default function NoteEditor() {
  const [open, setOpen] = useState(false)
  return (
    <div className="fixed bottom-6 right-6">
      <button onClick={() => setOpen(!open)} className="w-14 h-14 bg-cyan-500 hover:bg-cyan-400 rounded-full text-3xl font-bold flex items-center justify-center text-slate-900 shadow-lg">
        +
      </button>
      {open && (
        <div className="absolute bottom-16 right-0 w-80 h-96 bg-slate-800 border border-slate-700 rounded-xl p-4 shadow-2xl">
          <h3 className="font-bold mb-2 text-cyan-400">Private Markdown Note Editor</h3>
          <textarea className="w-full h-72 bg-slate-900 p-2 text-sm text-slate-200 rounded border border-slate-700 focus:outline-none" placeholder="Write private obsidian notes..."></textarea>
        </div>
      )}
    </div>
  )
}
