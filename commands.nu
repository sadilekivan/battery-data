export def calculate-internal-resistance [
    r: float # resistance of the measuring load
] {
    $in | update r (($in.V0 - $in.Vr) / ($in.Vr / $r))
}

# Parse the battery serial numbers last 5 characters to determine the day the cell was manufactured (for Sony cells)
# parsed according to here: http://kinstarbattery.com/Service/faq/13
export def parse-date-from-sn [
    file: string # csv file to read
] {
    echo $file
    let sn = open $file
    let date = $sn | each {|e|
        let year = $e.sn | split chars | match $in.9 {
            'A' => 1992,
            'B' => 1993,
            'C' => 1994,
            'D' => 1995,
            'E' => 1996,
            'F' => 1997,
            'G' => 1998,
            'H' => 1999,
            'I' => 2000,
            'J' => 2001,
            'K' => 2002,
            'L' => 2003,
            'M' => 2004,
            'N' => 2005,
            'O' => 2006,
            'P' => 2007,
            'Q' => 2008,
            'R' => 2009,
            'S' => 2010,
            'T' => 2011,
            'U' => 2012,
            'V' => 2013,
            'W' => 2014,
            'X' => 2015,
            'Y' => 2016,
            'Z' => 2017,
        }

        let month = $e.sn | split chars | match $in.10 {
            'A' => 1,
            'B' => 2,
            'C' => 3,
            'D' => 4,
            'E' => 5,
            'F' => 6,
            'G' => 7,
            'H' => 8,
            'I' => 9,
            'J' => 10,
            'K' => 11,
            'L' => 12,
        }

        let day = $e.sn | str substring 11..13 | into int
        
        $"($year)-($month)-($day)" | into datetime | each {{date: $in}}
    }

    $sn | merge $date 
}
