export default function FacultyUpload() {
  return (
    <div className="bg-slate-800 p-6 rounded-xl border border-slate-700 flex flex-col gap-4">
      <h3 className="text-xl font-semibold text-cyan-400">Upload Notes & Assignments</h3>
      <select className="bg-slate-900 border border-slate-700 p-2 rounded text-sm">
        <option>Select Target Section (Section A, B, C)</option>
      </select>
      <input type="file" className="text-sm text-slate-400" />
      <button className="bg-cyan-600 hover:bg-cyan-500 p-2 rounded text-sm font-bold">Publish Content</button>
    </div>
  )
}
