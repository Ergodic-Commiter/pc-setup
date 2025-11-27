I like to set the panels at a corner with precision.  
If the left/top panels are 60/36 pixels wide/long, 
I want their starting positions to be at 36/60 from the top/left edges.  
In order to do so I do the following:  
- Open both `.config/{plasma-org.kde.plasma.desktop-appletsrc, plasmashellrc}`. 
- Identify the corresponding applets' ids in the former
    Perhaps finding `plugin=og.kde.panel`, say `[Containments][359]`
- Modifying the `(max|min)Length` entries in: 
    ```
    [PlasmaViews][Panel 359][Vertical745]
    maxLength=709  # (=745-36)
    minLength=709
    ```  
    And equivalently for `...[Horizontal1324]`
    with `maxLength=1264   # (=1324-60)`

- Restart Plasma.  

