# Pronouncingex

**get the english (IPA) pronunciation for a word or phrase**

## Installation


```elixir
def deps do
  [
    {:pronouncingex, "~> 0.1.1"}
  ]
end
```

## How use
```elixir
#get the IPA sound
Pronouncingex.pronounce("are you kidding me", :ipa)
# => ɑɹ ju kɪdɪŋ m̩i

#get a simplified pronunciation
Pronouncingex.pronounce("are you kidding me")
# => Ar yU kIdIn m̩i 

#you can get the Arpabet pronunciation but just for a word (for a phrase arpabet can be a bit clumsy)
Pronouncingex.pronounce("kidding", :arpabet)

```

### the simplified version can be improved for future releases

many thanks to [aparrish](https://github.com/aparrish/pronouncingjs) for the idea, this is a simplified version and use IPA along with Arpabet



