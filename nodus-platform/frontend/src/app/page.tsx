import Link from 'next/link'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <h1 className="text-5xl font-bold mb-4">NODUS Knowledge Network</h1>
      <p className="text-xl text-slate-400 mb-8">4-Year Interconnected Academic Platform with Syllabus-Grounded AI</p>
      <div className="flex gap-4">
        <Link href="/dashboard" className="px-6 py-3 bg-cyan-600 rounded-lg hover:bg-cyan-500">Student Dashboard</Link>
        <Link href="/faculty" className="px-6 py-3 bg-indigo-600 rounded-lg hover:bg-indigo-500">Faculty Portal</Link>
      </div>
    </main>
  )
}
