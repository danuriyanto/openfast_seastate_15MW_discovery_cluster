function [ssiFile] = ssiFileLookup(siteName)

if     strcmpi(siteName,'MA_shallow')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_10.5m_105.0t_sandy2.txt';
elseif strcmpi(siteName,'MA_median')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_11.5m_115.0t_sandy2.txt';
elseif strcmpi(siteName,'MA_deep')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_13.0m_124.0t_sandy2.txt';
elseif strcmpi(siteName,'NY_shallow')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_9.5m_95.0t_sandy2.txt';
elseif strcmpi(siteName,'NY_median')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_10.5m_96.0t_sandy2.txt';
elseif strcmpi(siteName,'NY_deep')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_11.0m_108.0t_sandy2.txt';
elseif strcmpi(siteName,'MD_shallow')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_9.0m_95.0t_sandy2.txt';
elseif strcmpi(siteName,'MD_median')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_9.5m_97.0t_sandy2.txt';
elseif strcmpi(siteName,'MD_deep')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_11.0m_102.0t_sandy2.txt';
elseif strcmpi(siteName,'NJ_shallow')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_9.0m_92.0t_sandy2.txt';
elseif strcmpi(siteName,'NJ_median')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_9.5m_95.0t_sandy2.txt';
elseif strcmpi(siteName,'NJ_deep')
    ssiFile = '/IEA-15-240-RWT/ssi/SSI_10.0m_95.0t_sandy2.txt';
end

end