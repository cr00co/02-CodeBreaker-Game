import SwiftUI

struct ContentView: View {
    var body: some View {
        Spacer()
        VStack(spacing: 10) {
            Pegs(colors: [.yellow, .green, .blue, .red])
            Pegs(colors: [.green, .blue, .red, .yellow])
            Pegs(colors: [.blue, .red, .yellow, .green])
            Pegs(colors: [.red, .yellow, .green, .blue])
            Pegs(colors: [.yellow, .blue, .green, .red])
            Pegs(colors: [.green, .red, .yellow, .blue])
            Pegs(colors: [.blue, .yellow, .red, .green])
            Pegs(colors: [.red, .green, .blue, .yellow])
        }
        .padding()
        Spacer()
        
        BottomPegs()
    }
}

struct Pegs: View {
    var colors: [Color]
    
    var body: some View {
        HStack(spacing: 25) {
            ForEach(colors.indices, id: \.self) { index in
                ColoredRoundedRectangle(color: colors[index], size: 50)
            }
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
        }
    }
}

struct BottomPegs: View {
    var body: some View {
        HStack(spacing: 20) {
            ColoredRoundedRectangle(color: .yellow, size: 75)
            ColoredRoundedRectangle(color: .green, size: 75)
            ColoredRoundedRectangle(color: .blue, size: 75)
            ColoredRoundedRectangle(color: .red, size: 75)
        }
        .padding()
    }
}

struct ColoredRoundedRectangle: View {
    var color: Color
    var size: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: size, height: size)
            .foregroundStyle(color)
    }
}

#Preview {
    ContentView()
}
