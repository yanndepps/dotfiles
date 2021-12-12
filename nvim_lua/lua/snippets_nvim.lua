local S = require'snippets'
package.path = package.path .. ";/home/kf/.local/share/nvim/site/pack/packer/start/scnvim/scnvim-data/scnvim_snippets.lua"

local CPP = {}
-- inspired by madskjeldgaard's snippets
-- Casting
CPP.staticcast = [[static_cast<${1:int}>(${2:f})]];
CPP.cast=CPP.staticcast;

-- Function
CPP.func = [[${1:void} ${2:func}(${3:int i}){
	${0://code}
}]];

-- Vector
CPP.vec = [[std::vector<$1> $2]];
CPP.vector = CPP.vec

-- Array
CPP.arr = [[std::array<$1, $2>]]
CPP.array = CPP.arr

-- Map
CPP.map = [[std::map<${1:std::string}, ${2:int}>]];

CPP.ofhpp = [[
#pragma once

#include "ofMain.h"

class ${1|vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}{
	public:
        void setup();
        void update();
        void draw();

	private:
};
}
]];

CPP.ofcpp = [[
#include "${=tostring(vim.fn.expand("%:t:r")) .. '.h'}"

void ${=vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}::setup(){
    $1
}

void ${=vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}::update(){
    $2
}

void ${=vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}::draw(){
    $3
}]];

-- Conditionals
CPP["if"] = [[if (${1:true}) {
	${2://code}
}]];

CPP.ifelse = [[if (${1:true}) {
	${2://code}
} else {
	${3://code}
}]]

CPP.switch = [[switch (${1:n}) {
case ${2:1}:
  ${3://code}
  break;
case ${4:2}:
  ${5://code}
  break;
default: 
  ${6://code}
}]]
CPP.sw = CPP.switch

-- supercollider
local SC = {}
SC.synthdef = [[
SynthDef(\\$1, {
    var sig, env, $2;
    env = EnvGen.kr(Env.asr( \attack.kr(0.01), 1, \release.kr(0.01)), gate: \gate.kr(1), doneAction: \da.kr(2));
    $0
    sig = sig * \amp.kr(1, 0.1) * env;
    Out.ar(\out.kr(0), sig);
}).add;
]]
SC.sd = SC.synthdef
SC.mb = [[
~${1|vim.fn.expand('%:t:r')} = ~mb.collect{|id, idx|
    MBDeltaTrig.new(
        speedlim: ${2:0.5}, 
        threshold: ${3:0.05}, 
        minibeeID: id,
        minAmp: ${4:-20},
        maxAmp: ${5:0},
        function: {|dt, minAmp, maxAmp|
            $0
        }
    );
};
]]
SC.busa = [[Bus.audio(s, ${1:1});]];
SC.busc = [[Bus.control(s, ${1:1});]];
SC.synth = [[Synth(\\$1, [
$0
]);]]
SC.pdef = [[Pdef(\\$1,
    Pbind(
        \instrument, \\$2,
        \\$0
    )
)
]]
SC.pbind = [[Pbind(
    \instrument, \\$1,
    \\$0
)
]]
SC.nspeak = [[~numSpeakers]];
SC.cue = [[~cuelist.add(
    timeline: [
        $1
    ],
    function: {
        ~cuelist.hook = {|cl| 
        ~cuelist.timelineRegister[cl.current.asSymbol].stop;
        $2
        }
    }
)
]]
SC.executefile = [[this.executeFile(${1:~sketchdir+/+}"$2.scd");]];
SC.fxchain = [[~${1|vim.fn.expand('%:t:r')}Fx = FxChain.new(
    level: ${2:0.dbamp},
    in: ${3:~mic[1]},
    out: ${4:~mainBus},
    fadeInTime: ${5:1},
    fadeOutTime: ${6:1},
    numInputBusChannels: ${7:1}, 
);
]]
SC.fxadd = [[~${1|vim.fn.expand('%:t:r')}Fx.add(\\${2:eq},[
$3
\mix, ${4:1.0},
]);
]]
SC.fxa = SC.fxadd
SC.fxaddpar = [[~${1|vim.fn.expand('%:t:r')}.addPar(
    ${2:\comb}, [\mix, ${3:0.2}, $4],
);
]]
SC.fxap = SC.fxaddpar

-- markdown
local MD = {}
MD.a4 = [[
---
geometry: a4paper
title: $1
author: ${2:Kenneth Flak}
titlepage: ${3:false}
disable-header-and-footer: ${4:false}
date:  ${=os.date('%Y-%m-%d')}
---
]];

MD.hugo = [[
+++
title = "${=vim.fn.expand('%:t:r'):gsub('-', ' '):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)}"
date = ${=os.date("!%Y-%m-%dT%T+03:00")}
layout = "${2:text}"
toc = "${3:false}"
draft =  "${4:false}"
+++
]];

-- mail
local M = {}
M.soundma = [[
ssangrefam@gmail.com, alessandro.di.maso@outlook.com, klliroos@gmail.com, sandrama@tlu.ee, davidt@tlu.ee, birgit98@tlu.ee, marit2@tlu.ee, varts@tlu.ee
]]

local function append_scnvim_snippets(intable)
    local scnvimsnips = require'scnvim/utils'.get_snippets()
    for k,v in pairs(scnvimsnips) do
        intable[k] = v
    end
    return intable
end
append_scnvim_snippets(SC)

S.use_suggested_mappings(true)
S.snippets = {
    _global = {
        date = "${=os.date('%Y-%m-%d')}";
    };
    mail = M;
    markdown = MD;
    supercollider = SC;
    cpp = CPP;
    hpp = CPP;
    h = CPP;
}
