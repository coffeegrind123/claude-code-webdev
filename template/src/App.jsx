import React from 'react'

function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center px-4">
      <div className="max-w-4xl mx-auto text-center">
        <div className="bg-white rounded-2xl shadow-xl p-8 md:p-12">
          <div className="mb-8">
            <h1 className="text-5xl md:text-6xl font-bold text-gray-900 mb-6">
              🚀 Ready to Build!
            </h1>
            <p className="text-xl md:text-2xl text-gray-600 mb-8">
              Your React + Vite + Tailwind CSS environment is ready
            </p>
          </div>
          
          <div className="grid md:grid-cols-3 gap-6 mb-8">
            <div className="bg-blue-50 rounded-xl p-6">
              <div className="text-3xl mb-4">⚛️</div>
              <h3 className="font-semibold text-gray-900 mb-2">React 18</h3>
              <p className="text-gray-600 text-sm">Modern React with hooks and concurrent features</p>
            </div>
            <div className="bg-purple-50 rounded-xl p-6">
              <div className="text-3xl mb-4">⚡</div>
              <h3 className="font-semibold text-gray-900 mb-2">Vite</h3>
              <p className="text-gray-600 text-sm">Lightning fast build tool with hot reload</p>
            </div>
            <div className="bg-cyan-50 rounded-xl p-6">
              <div className="text-3xl mb-4">🎨</div>
              <h3 className="font-semibold text-gray-900 mb-2">Tailwind CSS</h3>
              <p className="text-gray-600 text-sm">Utility-first CSS framework for rapid UI development</p>
            </div>
          </div>
          
          <div className="space-y-4">
            <p className="text-gray-600">
              Start building your application by editing <code className="bg-gray-100 px-2 py-1 rounded text-sm font-mono">src/App.jsx</code>
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <button className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium">
                Start Coding
              </button>
              <button className="bg-gray-200 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-300 transition-colors font-medium">
                View Documentation
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default App