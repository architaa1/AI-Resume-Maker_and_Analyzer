# AI-Resume-Maker_and_Analyzer

**AI-Resume-Maker_and_Analyzer** is a modified and enhanced version of *Smart-AI-Resume-Analyzer* — an AI-powered tool to analyze, evaluate, and give feedback on resumes. It extracts resume data, runs analyses (skills, experience, formatting, ATS-compatibility), and helps users improve their CV before job applications.

---

## 🚀 Features

- Upload resume (PDF / doc) and extract content automatically  
- Parse and structure resume into sections: Education, Skills, Experience, Projects, etc.  
- Analyze resume for **completeness**, **skill-match**, **formatting / ATS compatibility**  
- Provide suggestions and feedback to improve resume quality  
- Option to export results or report  

---

## 🧰 Tech Stack

- **Backend / Resume processing**: Python (PDF parsing, text extraction, NLP)  
- **UI / Frontend**: Streamlit (web interface)  
- **Database / Storage**: SQLite / local file storage (optional, if configured)  
- **License**: MIT (see LICENSE file)  

---

## 📥 Installation & Usage

```bash
# Clone the repository
git clone https://github.com/architaa1/AI-Resume-Maker_and_Analyzer.git
cd AI-Resume-Maker_and_Analyzer

# (Optional) create virtual environment
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run the application
streamlit run App.py   # or whichever main file is present

