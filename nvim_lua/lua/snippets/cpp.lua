local CPP = {}
-- stolen from madskjeldgaard's snippets
-- Casting
CPP["staticcast"] = [[static_cast<${1:int}>(${2:f})]];
CPP["cast"]=CPP["staticcast"];

-- Literals
CPP["fl"] = [[float ${1:var} = ${2:1.0f;}]]
CPP["float"] = CPP["fl"];
CPP["int"] = [[int ${1:var} = ${2:1;}]]
CPP["double"] = [[double ${1:var} = ${2:1.0;}]]
CPP["db"] = CPP["double"]

-- Function
CPP["fun"] = [[${1:void} ${2:func}(${3:int i}){
	${4://code}
}]];
CPP["function"] = CPP["fun"];

-- Vector
CPP["vec"] = [[std::vector<${1:int}> ${2:v} = { ${3:1}, ${4:2}, ${5:3} };]];
CPP["vector"] = CPP["vec"]

-- Array
CPP["arr"] = [[std::array<${1:int}, ${2:3}> ${3:a} = {${4:1}, ${5:2}, ${6:3}};]]
CPP["array"] = CPP["arr"]

-- Map
CPP["map"] = [[std::map<${1:std::string}, ${2:int}> ${3:m} { {"${4:CPU}", ${5:10}}, {"${6:GPU}", ${7:15}}, $0};]];

CPP["hppclass"] = [[
#pragma once

namespace ${1|vim.fn.expand("%:t:r")}{
class ${2| vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}{
	public:
		float process(float sample);
	private:
};
}
]];

CPP["cppclass"] = [[
#include "${4|tostring(vim.fn.expand("%:t:r")) .. '.hpp'}"

namespace ${1|vim.fn.expand("%:t:r")}{
float ${2|vim.fn.expand("%:t:r"):gsub("^%l", string.upper)}::process(float sample){
	return ${3:0.f;}
}

}
]];

-- Conditionals
CPP["if"] = [[if (${1:true}) {
	${2://code}
}]];

CPP["ifelse"] = [[if (${1:true}) {
	${2://code}
} else {
	${3://code}
}]]

CPP["switch"] = [[switch (${1:n}) {
case ${2:1}:
  ${3://code}
  break;
case ${4:2}:
  ${5://code}
  break;
default: 
  ${6://code}
}]]

CPP["sw"] = CPP["switch"]

return CPP
