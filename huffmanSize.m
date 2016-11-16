function lencomp=complen(x)
  [m,n]=size(x);
  x=reshape(x,m*n,1);
  x = x-min(x);
  symbols = unique(x);
  %If image has only one color cant build hist
  if(symbols==0)
    symbols=1;
  end
  freq=hist(x,symbols);
  p=freq/sum(freq);
  dict=huffmandict(symbols,p);
  lencomp=0;
  lencomp=lencomp+nextpow2(max(x))*length(symbols);
  for k=1:length(symbols)
    lencomp=lencomp+length(dict{k});
  end
  lencomp=lencomp+2*32;
  lencomp=lencomp+32;
  for k=1:length(symbols)
    lencomp=lencomp+freq(k)*length(dict{k});
  end
end