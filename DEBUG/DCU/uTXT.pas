unit uTXT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmTXT = class(TForm)
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    GroupBox1: TGroupBox;
    edtValorDesejado: TEdit;
    Button4: TButton;
    Label5: TLabel;
    edtData: TEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtBloco: TEdit;
    Label3: TLabel;
    edtBlocoItens: TEdit;
    btGerar: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edtCaminho: TEdit;
    btnCarregar: TButton;
    procedure btnCarregarClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

    procedure CarregarArquivo(ACaminho, ABlocoHeader, ABlocoItens: string);

    procedure CarregarArquivo2(Acaminho : string;  ALista :TStringList);

    procedure CarregarContribuicoes(ACaminho, AData: string; AValor : Currency);

    function ValidaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  frmTXT: TfrmTXT;

implementation

{$R *.dfm}

procedure TfrmTXT.btGerarClick(Sender: TObject);
begin
  if ValidaCampos then
    self.CarregarArquivo(edtCaminho.Text, Trim(edtBloco.Text), Trim(edtBlocoItens.Text));
end;

procedure TfrmTXT.btnCarregarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

procedure TfrmTXT.Button3Click(Sender: TObject);
var
  vetor: array[0..10] of Integer;
  valorDesejado: Integer;
  combinacoes: TStringList;
  i, j, k: Integer;
  soma: Integer;
begin
  vetor[0] := 1;
  vetor[1] := 3;
  vetor[2] := 5;
  vetor[3] := 3;
  vetor[4] := 17;
  vetor[5] := 9;
  vetor[6] := 31;
  vetor[7] := 9;
  vetor[8] := 12;
  vetor[9] := 50;
  vetor[10] := 18;

  valorDesejado := 78;
  i := 0;
  j := 0;
  k := 0;

  combinacoes := TStringList.Create;

  try
   for i := 1 to Length(vetor) do
    begin
      for j := 0 to Length(vetor) - i do
      begin
        soma := 0;
        for k := j to j + i - 1 do
          soma := soma + vetor[k];

        if soma = valorDesejado then
        begin
          combinacoes.Add('Combinação encontrada: ' + IntToStr(i) + ' elementos na posição ' + IntToStr(j) + ' e ' + IntToStr(k -1) +  ' com soma ' + IntToStr(soma));
        end;
      end;
    end;
    if combinacoes.Count > 0 then
      ShowMessage(combinacoes.Text)
    else
      ShowMessage('Nenhuma combinação encontrada!');
  finally
    combinacoes.Free;
  end;
end;


procedure TfrmTXT.Button4Click(Sender: TObject);
begin
  self.CarregarContribuicoes(edtCaminho.Text, Trim(edtData.Text), StrToCurr(FormatCurr('0.00', StrToCurr( edtValorDesejado.Text))));
end;

procedure TfrmTXT.CarregarArquivo(ACaminho, ABlocoHeader, ABlocoItens: string);
var
//  arquivo1, arquivo2 :TextFile;
//  Linha, Letra:String;

  i, a: integer;
  strLst, Strdelete: TStringList;
  {arquivo,} linha, arm : string;
  vPosition : Boolean;
begin
//  AssignFile('arquivo.txt', arquivo1);
//  AssingFile('novo_arquivo.txt',arquivo2);
//  try
//    Reset(arquivo1);
//    ReWrite(Arquivo2);
//  finally
//
//  end;

  //arquivo := edtCaminho.Text;
  i := 0;
  vPosition := False;

  strLst := TStringList.Create;

  Strdelete := TStringList.Create;
  try
    strLst.LoadFromFile(ACaminho);
    strLst.BeginUpdate;

//    for i := strLst.Count - 1 downto 0 do
    while i < strLst.Count - 1 do
    begin
      if Copy(strLst.Strings[i], 2, 4) = ABlocoHeader then
//      if (Pos(strLst.Strings[i],ABloco)> 0) then
      begin
        vPosition := False;
        linha := strLst.Strings[i];

        for a := 1 to linha.Length -1 do
        begin
          if linha[a] <> '|'  then
            arm := arm + linha[a]
          else if linha[a] = '|' then
          begin
            if not (Length(arm) = 44) then
              arm := EmptyStr
            else
            begin
              if copy(arm, 41,4) = '5342' then
              begin
                Strdelete.Add(IntToStr(i));
                linha := EmptyStr;
                arm := EmptyStr;
                vPosition := True;

                Break;
              end;
            end;
          end;
        end;
      end
      else if (Copy(strLst.Strings[i], 2, 4) = ABlocoItens) and (vPosition = True) then
      begin
        Strdelete.Add(IntToStr(i));
      end;
    Inc(i);
    end;

    Strdelete.BeginUpdate;
    for i := Strdelete.Count - 1 downto 0 do
    begin
      if (Strdelete.Strings[i] <> EmptyStr) then
        strLst.Delete(StrToInt(Strdelete.Strings[i]));
    end;
    Strdelete.EndUpdate;

    strlst.EndUpdate;


    strLst.SaveToFile('SPED.txt');

    Application.MessageBox('Arquivo gerado com sucesso.','OK',MB_ICONINFORMATION);
  finally
    FreeAndNil(strLst);
    FreeAndNil(Strdelete);
  end;

end;

procedure TfrmTXT.CarregarArquivo2(Acaminho: string; ALista: TStringList);
var
  i, a, j: integer;
  strLst: TStringList;
  linha, arm : string;
begin

  strLst := TStringList.Create;

  try
    strLst.LoadFromFile(ACaminho);

    strLst.BeginUpdate;

    for i := strLst.Count - 1 downto 0 do
    begin
      for j := 0 to ALista.Count -1 do
      begin
        if Copy(strLst.Strings[i], 2, 4) = ALista[j] then
  //      if (Pos(strLst.Strings[i],ABloco)> 0) then
        begin
          linha := strLst.Strings[i];

          for a := 1 to linha.Length -1 do
          begin
            if linha[a] <> '|'  then
              arm := arm + linha[a]
            else if linha[a] = '|' then
            begin
              if not (Length(arm) = 44) then
                arm := EmptyStr
              else
              begin
                if copy(arm, 41,4) = '5342' then
                begin
                  strLst.Delete(i);
                  arm := EmptyStr;
                  Break;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    strlst.EndUpdate;
    strLst.SaveToFile('SPED.txt'); //  edtCaminho.Text);
    Application.MessageBox('Arquivo gerado com sucesso.','OK',MB_ICONINFORMATION);

  finally
    FreeAndNil(strLst);
  end;

end;

procedure TfrmTXT.CarregarContribuicoes(ACaminho, AData: string; AValor : Currency);
var
  i, a, b, j,k,  posi, contSep: integer;
  strLst, StrArmValores, combinacoes : TStringList;
  { arquivo, } linha, arm, GValor, posicao, vInicial, vFinal, vDelete: string;
  vPosition: Boolean;
  soma : Currency;
begin
  i         := 0;
  posi      := 0;
  contSep   := 0;
  b         := 0;
  j         := 0;
  k         := 0;
  soma      := 0;
  posicao   := '';
  GValor    := '';
  vPosition := False;
  vInicial  := EmptyStr;
  vFinal    := EmptyStr;
  vDelete   := EmptyStr;

  strLst := TStringList.Create;
  StrArmValores := TStringList.Create;

  try
    strLst.LoadFromFile(ACaminho);
    strLst.BeginUpdate;

    for i := 0 to strLst.Count -1 do
    begin
      vPosition := False;

      if (Copy(strLst.Strings[i], 0, 8) = AData) and (Copy(strLst.Strings[i], 10,4) = 'C870') then
      begin
        linha := strLst.Strings[i];

        for a := 1 to Length(linha) do
        begin
          if not (vPosition) then
          begin
            posi := posi + 1;

            if contSep < 4 then
            begin
              if linha[a] = '|' then
                contSep := contSep + 1
            end
            else
            begin
              for b := posi to Length(linha) do
              begin
                if (linha[b] in ['0'..'9',',']) and (linha[b] <> '|') then
                  GValor := GValor + linha[b]
                else
                begin
                  StrArmValores.Add(IntToStr(i) + '|' +  GValor);
                  GValor    := EmptyStr;
                  vPosition := True;
                  contSep   := 0;
                  posi      := 0;
                  Break;
                end;
              end;
            end;
          end
          else
            Break;
        end;

      end;
    //  Inc(i);
    end;

  //  StrArmValores.BeginUpdate;

    combinacoes := TStringList.Create;

    try
      for i := 1 to StrArmValores.Count do
      begin
        if combinacoes.Count < 3 then
        begin
          for j := 0 to StrArmValores.Count - i do
          begin
            soma := 0;
            for k := j to j + i - 1 do
            begin
              linha := StrArmValores.Strings[k];

              for b := 1 to Length(linha) do
              begin
                if linha[b] = '|' then
                begin
                  GValor := Copy(linha, b + 1, length(linha));
                  Break;
                end;
              end;

              soma    := soma + StrToCurr(GValor);
              GValor  := EmptyStr;
              //posicao := EmptyStr;
            end;

            if (soma = AValor) or ((soma >= AValor) and (soma <= AValor + 0.15)) then
            begin
  //            combinacoes.Add('Combinação encontrada: ' + IntToStr(i) + ' elementos na posição ' + IntToStr(j) + ' e ' + IntToStr(k -1) +  ' com soma ' + CurrToStr(soma));
              //Soma + Posição Inicial + Posição Final + Nro de combinações
              combinacoes.Add(CurrToStr(soma)  + '|' + IntToStr(j) + '|' + IntToStr(k -1) + '|' +  IntToStr(i) );
            end;
          end;
        end
        else
          Break;
      end;

      combinacoes.Sort;

      if combinacoes.Count > 0 then
      begin
        ShowMessage('Combinações ( = ) ou próxima ao valor inserido ' + #13#13 + combinacoes.Text);

        linha := combinacoes.Strings[0];

        vPosition := False;

        for a := 1 to Length(linha) do
        begin
          if not (vPosition) then
          begin
            if linha[a] = '|' then
            begin
              for b := a + 1 to Length(linha) do
              begin
                if (linha[b] in ['0'..'9',',']) and (linha[b] <> '|') then
                  vInicial := vInicial + linha[b]
                else if linha[b] = '|' then
                begin
                  posi := b + 1;
                  Break;
                end;
              end;

              for b := posi to Length(linha) do
              begin
                if (linha[b] in ['0'..'9',',']) and (linha[b] <> '|') then
                  vFinal := vFinal + linha[b]
                else if linha[b] = '|' then
                begin
                  posi := 0;
                  vPosition := True;
                  Break;
                end;
              end;
            end;
          end
          else
            Break;
        end;

       vPosition := False;

       if not (vInicial.IsEmpty) and not(vFinal.IsEmpty) then
       begin
         for i := StrToInt(vFinal) downto StrToInt(vInicial) do
         begin
           vDelete := EmptyStr;

           StrArmValores.BeginUpdate;

           for a := StrArmValores.Count -1  downto 0 do
           begin
             if a = i then
             begin
               linha := StrArmValores.Strings[a];

               for b := 1 to Length(linha) do
               begin
                 if (linha[b] in ['0'..'9',',']) and (linha[b] <> '|') then
                   vDelete := vDelete + linha[b]
                 else
                   Break;
               end;

               if StrToInt(vDelete) > 0 then
               begin
                 strLst.Delete(StrToInt(vDelete));
                 Break;
               end;
             end;
           end;
           StrArmValores.EndUpdate;
         end;
       end;
      end
      else
      begin
        ShowMessage('Nenhuma combinação encontrada!');
      end;
    finally
      combinacoes.Free;
    end;


   // StrArmValores.EndUpdate;

    strlst.EndUpdate;

    strLst.SaveToFile('SPED_CONTRIBUICOES.txt');
    Application.MessageBox('Arquivo gerado com sucesso.','OK',MB_ICONINFORMATION);

  finally
    strLst.Free;
    StrArmValores.Free;
  end;

end;

function TfrmTXT.ValidaCampos: Boolean;
begin
  Result := True;

  if not (FileExists(edtCaminho.Text)) then
  begin
    Application.MessageBox('Arquivo não identificado.','Atenção',MB_ICONERROR);
    Exit(False);
  end;

  if Trim(edtBloco.Text) = EmptyStr then
  begin
    Application.MessageBox('Informe o Bloco de Cabeçalho.','Atenção',MB_ICONERROR);
    Exit(False);
  end;

  if Trim(edtBlocoItens.Text) = EmptyStr then
  begin
    Application.MessageBox('Informe o Bloco de Itens.','Atenção',MB_ICONERROR);
    Exit(False);
  end;
end;

end.
