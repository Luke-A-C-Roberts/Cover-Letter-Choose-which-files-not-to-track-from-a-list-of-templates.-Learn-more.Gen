def generate(name, baddressing, role, location, site, bpeople)
    template = 
"\\documentclass{letter}
\\usepackage[T1]{fontenc}
\\usepackage{tgbonum}
\\usepackage{geometry}
\\geometry{
    a4paper,
    total={170mm,257mm},
    left=20mm,
    top=0mm,
}
\\signature{#{name}}
\\date{}

\\begin{document}
\\begin{letter}

\\large

\\opening{Dear Sir or Madam,}

I am writing to apply for the #{role} role at #{location}, which I saw advertised on #{site}. After reading the job description, I understand that you are looking for someone who is able to perform the role's responsibilities to a high standard and I feel I am capable of doing so. I have provided a copy of my CV and would be grateful if you considered my application for this job.

At the moment I am sudying Computer Science (BSc) at the University of Lincoln and I am currently looking for part time, seasonal work while back at home. Due to my solid educational foundations I am a fast learner and am able to retain infomation about my work effectively. I am highly numerate and computer literate due to my past and present studies. I think that I would #{bpeople ? "enjoy working as a #{role} because I am good at working with people, which I illustrated while working as a lunchtime supervisor during my time at my sixth form. I am also very capable of managing my time and am flexible in when I can work shifts" : "be good as a #{role} because I work well individually. Additionally, I have past experience working as a lunchtime supervisor at my school so I have learnt the importance of time management, which I would exercise to my best ability. I am flexble in when I can work shifts"}. 

Thank you for your time and consideration and I look forward to hearing from you.

\\closing{Yours Sincerely,}

\\end{letter}
\\end{document}"
end

def pgs(message, option)
    print("#{message}#{option ? " [y/n]" : ""}: ")
    input = gets()
    input.gsub!("\n","")
    option ? (['y','yes'].include?(input.downcase) ? true : false) : input
end

#test
#print(generate("Luke","assistant worker","tesco","indeed",false))

temp = generate(
    pgs("what is your name, false"),
    pgs("are you addressing someone specific",true) ? pgs("who are you addressing",false) : "Sir or Madam",
    pgs("what job roll are you applying for",false),
    pgs("what location are you applying to",false),
    pgs("where did you hear about the job",false),
    pgs("does this job require you to work with people",true)
)

aux = "\\relax 
\\@mlabel{}{\\unhbox \\voidb@x \\ignorespaces \\@@par \\protect \\nobreak  \\\\}
\\gdef \\@abspage@last{1}"

open("./temp.tex","w") do |f| f << temp end
open("./temp.aux","w") do |f| f << aux end
