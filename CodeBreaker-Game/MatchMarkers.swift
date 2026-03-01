import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match]
    
    var body: some View {
        VStack {
            HStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            HStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in match == .exact})
        let foundCount: Int = matches.count(where: { match in match != .nomatch})
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
}
