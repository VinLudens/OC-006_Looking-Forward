\version "2.18.2"

date = #(strftime "%B %d %Y" (localtime (current-time)))
\header {
  title = "Looking Forward"
  subtitle = "Original Composition No. 6"
  %instrument = "Piano"
  composer = "Kevin L. Biewesch"
  %arranger = "Kevin L. Biewesch"
  tagline = \markup { \center-column {
    \with-url #"https://youtube.com/@VinLudens"
    \line { "Engraving with Lilypond" $(lilypond-version) \char ##x2014 "https://youtube.com/@VinLudens" }
    \line { \small \italic {  February 18 2019  } }
  } }
}

\paper {
  #(set-paper-size "a4")
  system-count = #23
  %page-count = #4
  evenHeaderMarkup = \markup { \if \should-print-page-number { \fill-line { "" \fromproperty #'page:page-number-string } } }
  oddHeaderMarkup = \evenHeaderMarkup
}

\include "global.ly"
\include "right.ly"
\include "left.ly"
\include "dynamics.ly"

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Dynamics = "Dynamics" \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout {
   }
  \midi {
    %\tempo 4=80
  }
}
