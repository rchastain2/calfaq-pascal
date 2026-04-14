
program calfaqdemo;

{$MODE objfpc}
{$LINK calfaq.o}

uses
  SysUtils, calfaq;

function ShortDate(m, d: longint): string;
begin
  case m of
    3: result := 'Mar';
    4: result := 'Apr';
    otherwise
      result := '???';
  end;
  result := Format(result + '%0.2d', [d]);
end;

var
  y, m, d: longint;

begin
  for y := 1900 to 2199 do
  begin
    if y mod 10 = 0 then
      Write(y:5, ' ');
    easter(GREGORIAN, y, m, d);
    Write(ShortDate(m, d));
    if y mod 10 = 9 then
      WriteLn
    else
      Write(' ');
  end;
end.
