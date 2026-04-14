
{
  https://tondering.dk/claus/calendar.html
  https://github.com/williamhunter/pascal-bindings-for-c
}

{$linklib libcalfaq.a}

uses
  ctypes;

function is_leap(style, year: cint): cint; cdecl; external;

const
  GREGORIAN = 1;

begin
  WriteLn(is_leap(GREGORIAN, 2000)); { 1 }
end.
