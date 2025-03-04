"""Models extracted from .../karabiner/my_config.json
"""

# pylint: disable=used-before-assignment

from json import load
from pathlib import Path
from typing import Optional

from pydantic import BaseModel, Field

my_karabiner = "refs/my-libs/karabiner/my_config.json"  # pylint: disable=invalid-name


class Karabiner(BaseModel): 
    profiles : list[KProfile]
    global_k : ParamDict[bool] = Field(alias='global')

class KProfile(BaseModel): 
    name : str
    selected : bool
    devices : list[KDevice]
    simple_modifications : list[FromTo]
    complex_modifications : KModifications
    parameters : ParamDict
    virtual_hid_keyboard : ParamDict

class KDevice(BaseModel): 
    pass 

class FromTo(BaseModel): 
    type_k : Optional[str]
    from_k : KeyCombination = Field(alias='from')
    to : KeyCombination

class KModifications(BaseModel): 
    rules : list[KRule]
    parameters : ParamDict[int]

class KRule(BaseModel): 
    description : str 
    manipulators : list[Manipulator]

class Manipulator(BaseModel): 
    description : str
    conditions : list[kCondition]

class ParamDict(BaseModel): 
    pass

class KeyCombination: 
    pass



if __name__ == '__main__': 
    file_0 = Path(my_karabiner)
    k_json = load(file_0)
    k_obj = Karabiner(k_json)
    k_obj.validate()
    
    stem_1 = file_0.stem + '_new'
    file_1 = file_0.with_stem(stem_1)
    k_obj.to_file(file_1)
